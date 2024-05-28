import express from 'express'
import connection from './db.js'

const router = express.Router()

router.get('/artists', (req, res) => {
  const username = req.query.username
  
  connection.execute(`
  SELECT * FROM artists WHERE username = ?;`,
  [username], (err, result) => {
    if (err) {
      res.sendStatus(500).json(err)
    } else {
      
      if (result.length === 0) {
        res.render('error', {
          title: 'Artist Not Found',
          data: 'Artist Not found, try looking for another username!'
        })

        return
      }

      res.render('artist_info', {
        title: username.charAt(0).toUpperCase() + username.slice(1).toLowerCase(),
        data: result,
        hash: '#info-card'
      });
    }
  });
});

// Ricerca canzone per titolo
router.get('/songs', (req, res) => {
  const title = req.query.title;

  connection.execute(`
    SELECT songs.*, GROUP_CONCAT(artists.username) AS artists
    FROM songs
    LEFT JOIN collaborations ON songs.id_song = collaborations.id_song
    LEFT JOIN artists ON collaborations.id_artist = artists.id_artist
    WHERE songs.title = ? 
    GROUP BY songs.id_song;`,
    [title], (err, result) => {
      if (err) {
        res.sendStatus(500).json(err);
      } else {
        if (result.length === 0) {
          res.render('error', {
            title: 'Song Not Found',
            data: 'Song Not Found, try looking for another title!'
          });
          return;
        }

        res.render('song_info', {
          title: title.charAt(0).toUpperCase() + title.slice(1).toLowerCase(),
          data: result,
          fromSongPage: req.query.fromSongPage = true
        });
      }
    });
});


router.get('/:username/songs', (req, res) => {
  const username = req.params.username
  //console.log(username)
  
  connection.execute(`
  SELECT songs.*, GROUP_CONCAT(artists.username) AS artists
  FROM (songs JOIN collaborations USING (id_song)) JOIN artists USING (id_artist)
  WHERE songs.id_song IN (
          SELECT id_song 
          FROM collaborations 
          JOIN artists USING (id_artist)
          WHERE artists.username = ?
      )
  GROUP BY songs.id_song;`,
  [username], (err, result) => {
    if (err) {
      res.sendStatus(500).json(err)
    } else {
      
      if (result.length === 0) {
        res.render('error', {
          title: 'Songs Not Found',
          data: 'Artist Not Found, try looking for another username!'
        })

        return
      }

      res.render('song_info', {
        title: username.charAt(0).toUpperCase() + username.slice(1).toLowerCase(),
        data: result,
        fromSongPage: req.query.fromSongPage = false
      })
    }
  })
})

export default router