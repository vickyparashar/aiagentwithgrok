const express = require('express');
const bodyParser = require('body-parser');
const axios = require('axios');
const fs = require('fs');
const path = require('path');
const { exec } = require('child_process');
const { v4: uuidv4 } = require('uuid');

// Bypass the certificate verification (only for local testing)
process.env.NODE_TLS_REJECT_UNAUTHORIZED = '0';

// Create an Express app
const app = express();
const PORT = 3000;

// Middleware for parsing JSON
app.use(bodyParser.json());
app.use(express.static('public'));

// Serve the HTML file
app.get('/', (req, res) => {
  res.sendFile(__dirname + '/index.html');
});

// Handle PowerShell script generation
app.post('/generate', async (req, res) => {
  const inputText = req.body.text;
  const xaiApiKey = "xai-1YU6eJGnUgOKmJR6IkBl3zaPy5fNKGjFtN8Dg4zPkdvssXtqWEIlY8zb6LHlS9v7XE9uXVSz3T0h80kQ";

  const jsonPayload = {
    messages: [
      {
        role: "system",
        content: `Your task is to first provide a simple, bullet-point explanation of what the script will do, and format it as comments in the PowerShell script.
  Then, generate only the executable PowerShell code without any additional explanations, ensuring the script is ready to run directly in PowerShell. 
  Do not include any extra details outside of the explanation in comments and the executable code.`
      },
      {
        role: "user",
        content: "Generate a PowerShell script to " + inputText
      }
    ],
    model: "grok-beta",
    stream: false,
    temperature: 0
  };

  try {
    // Make the API call to Grok-Beta
    const response = await axios.post(
      "https://api.x.ai/v1/chat/completions",
      jsonPayload,
      {
        headers: {
          "Content-Type": "application/json",
          "Authorization": `Bearer ${xaiApiKey}`
        }
      }
    );

    // Extract the generated PowerShell code from the response
    let taskDescription = response.data.choices[0].message.content;

    // Split the PowerShell code into lines
    let lines = taskDescription.split('\n');

    // Comment out the first and last line
    lines[0] = `# ${lines[0]}`;  // Comment the first line
    lines[lines.length - 1] = `# ${lines[lines.length - 1]}`;  // Comment the last line

    // Join the modified lines back into a single string
    taskDescription = lines.join('\n');

    // Generate a unique filename using UUID
    const uniqueFilename = `${uuidv4()}_task.ps1`;
    const filePath = path.join(__dirname, 'output', uniqueFilename);

    // Write the task code to a file inside the output folder
    fs.writeFileSync(filePath, taskDescription, 'utf8');

    // Send back the response and task description to the client
    res.json({ message: "Task generated successfully!", filePath: filePath, powershellCode: taskDescription });

  } catch (error) {
    console.error("Error generating task:", error);
    res.status(500).json({ error: "Failed to generate task." });
  }
});

// Execute the task (PowerShell code)
app.post('/execute', async (req, res) => {
  const { script } = req.body;

  try {
    // Save the script to a temporary file
    const tempFilePath = path.join(__dirname, 'temp.ps1');
    fs.writeFileSync(tempFilePath, script, 'utf8');

    // Execute the PowerShell script
    exec(`powershell -ExecutionPolicy Bypass -File ${tempFilePath}`, (error, stdout, stderr) => {
      if (error) {
        return res.status(500).json({ error: error.message });
      }
      if (stderr) {
        return res.status(500).json({ error: stderr });
      }
      res.json({ message: "Task executed successfully!" });
    });
  } catch (error) {
    console.error("Error executing task:", error);
    res.status(500).json({ error: "Failed to execute task." });
  }
});

// Start the server
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
