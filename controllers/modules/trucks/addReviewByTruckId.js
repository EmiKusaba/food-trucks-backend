const connection = require("../../../postgres/connection");

const addReviewByTruckId = (req, res) => {
  const truckId = parseInt(req.params.id);
  console.log(req.body);
  let {userId, rating, comment} = req.body;

  if(!userId || !rating || !comment) {
    return res.json({
      "success": false,
      "message": `Invalid parameters: ${JSON.stringify(req.body)}`,
    });
  }

  userId = parseInt(userId);
  rating = parseInt(rating);

  if(rating < 1 || rating > 5) {
    return res.json({
      "success": false,
      "message": `Invalid rating [1-5]: ${JSON.stringify(req.body)}`,
    });
  }

  connection.query("INSERT INTO reviews (truck_id, user_id, ts, rating, comment) VALUES ($1, $2, now(), $3, $4)", [truckId, userId, rating, comment], (err, result) => {
    if(err) {
      return res.status(500).send(`Error: ${err}`);
    }
    return res.json(result);
  });
};

module.exports = addReviewByTruckId;