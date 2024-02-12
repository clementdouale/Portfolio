// Test file for CI/CD example purpose

const fs = require('fs');
const path = require('path');

// Path to your index.html file
const indexPath = path.join(__dirname, 'index.html');

// Function to check if file exists
function checkFileExists(filePath) {
    return fs.promises.access(filePath, fs.constants.F_OK)
        .then(() => true)
        .catch(() => false);
}

// Function to check for a specific string in the file
async function checkContentInFile(filePath, searchString) {
    const fileContent = await fs.promises.readFile(filePath, 'utf8');
    return fileContent.includes(searchString);
}

// Main test function
async function runTests() {
    console.log("Running tests...");

    // Check if index.html exists
    const fileExists = await checkFileExists(indexPath);
    if (!fileExists) {
        console.error("Error: index.html not found.");
        process.exit(1);
    }

    // String expected to be found in index.html
    const contentCheck = await checkContentInFile(indexPath, 'Key Skills');
    if (!contentCheck) {
        console.error("Error: Specific content not found in index.html.");
        process.exit(1);
    }

    console.log("All tests passed!");
}

runTests();
