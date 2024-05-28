import express from 'express'
import connection from './db.js'

const router = express.Router()

router.get('/', (req, res) => {
  connection.execute(`
  SELECT title, album_name, username FROM (collaborations JOIN artists USING(id_artist)) JOIN songs USING(id_song)
  WHERE hot_hit = "yes" AND role = "Main Artist" LIMIT 5;`,
  (err, result) => {
    if (err) {
      res.sendStatus(500).json(err)
    } else {
      res.render('index', {
        title: 'MusicDB',
        data: result
      })
    }
  })
})

export default router