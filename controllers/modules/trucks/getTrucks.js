const connection = require("../../../postgres/connection");

const getTrucks = (req, res) => {
  connection.query("select t.id, t.name, t.description, c.name as category from trucks t join truck_categories tc on t.id = tc.truck_id join categories c on tc.category_id = c.id order by t.id", (err, result) => {
    if(err) {
      return res.status(500).send(`Error: ${err}`);
    }
    return res.json(result.rows);
  })
};

module.exports = getTrucks;