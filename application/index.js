const express = require('express');
const mysql = require('mysql2');

const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());

const db = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
});

db.connect((err) => {
  if (err) {
    console.error('Error connecting to MySQL:', err);
    return;
  }
  console.log('Connected to MySQL database');
});

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});

// Get all users
app.get('/cars', (req, res) => {
    db.query('SELECT * FROM cars', (err, results) => {
      if (err) throw err;
      res.json(results);
    });
  });
  
  // Get a user by ID
  app.get('/cars/:id', (req, res) => {
    const { id } = req.params;
    db.query('SELECT * FROM cars WHERE id = ?', [id], (err, results) => {
      if (err) throw err;
      res.json(results[0]);
    });
  });
  
  // Create a new user
  app.post('/cars', (req, res) => {
    const { model, brand, color } = req.body;
    db.query('INSERT INTO cars (model, brand, color) VALUES (?, ?, ?)', [model, brand, color], (err, result) => {
      if (err) throw err;
      res.json({ message: 'Car added successfully', id: result.insertId });
    });
  });
  
  // Update a user
  app.put('/cars/:id', (req, res) => {
    const { id } = req.params;
    const { model, brand, color } = req.body;
    db.query('UPDATE cars SET model = ?, brand = ?, color = ?, WHERE id = ?', [model, brand, color, id], (err) => {
      if (err) throw err;
      res.json({ message: 'Car updated successfully' });
    });
  });
  
  // Delete a user
  app.delete('/cars/:id', (req, res) => {
    const { id } = req.params;
    db.query('DELETE FROM cars WHERE id = ?', [id], (err) => {
      if (err) throw err;
      res.json({ message: 'Car deleted successfully' });
    });
  });
