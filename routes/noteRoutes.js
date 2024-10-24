const express = require('express');
const Note = require('../models/note');
const router = express.Router();

// POST: Create a new note
router.post('/notes', async (req, res) => {
  try {
    const { title, content } = req.body;
    const newNote = new Note({
      title,
      content
    });
    await newNote.save();
    res.status(201).json(newNote);
  } catch (error) {
    res.status(500).json({ message: 'Error creating note', error });
  }
});

// GET: Retrieve all notes
router.get('/notes', async (req, res) => {
  try {
    const notes = await Note.find();
    res.status(200).json(notes);
  } catch (error) {
    res.status(500).json({ message: 'Error fetching notes', error });
  }
});

module.exports = router;
