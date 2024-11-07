const express = require('express');
const router = express.Router();

// Example GET route
router.get('/data', (req, res) => {
  res.json({ message: 'Data fetched successfully!' });
});

// Example POST route
router.post('/submit', (req, res) => {
  const { data } = req.body;
  res.json({ message: `Data received: ${data}` });
});

module.exports = router;
