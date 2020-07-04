const connection = require("../../../postgres/connection");

const getReviewsByTruckId = (req, res) => {
  const truckId = parseInt(req.params.id);

  connection.query("SELECT r.*, u.name as username FROM reviews r join users u on r.user_id = u.id WHERE truck_id = $1 ORDER BY id", [truckId], (err, result) => {
    if(err) {
      return res.status(500).send(`Error: ${err}`);
    }
    return res.json(result.rows);
  })
};

module.exports = getReviewsByTruckId;