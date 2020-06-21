const connection = require("../../../postgres/connection");

const doLogin = (req, res) => {
  const {username, password} = req.body;

  if(!username || !password) {
    return res.json({
      "success": false,
      "message": `Invalid parameters: ${JSON.stringify(req.body)}`,
    });
  }

  connection.query("SELECT * FROM users WHERE name = $1", [username], (err, result) => {
    if(err) {
      return res.status(500).send(`Error: ${err}`);
    }

    const rows = result.rows;

    if(rows.length === 0) {
      return res.json({
        "success": false,
        "message": `No user named '${username}'.`,
      });
    }

    const matched = password === rows[0].password;
    if(!matched) {
      return res.json({
        "success": false,
        "message": `Incorrect password for user '${username}'.`,
      });
    }

    return res.json({
      "success": true,
      "message": `User '${username}' logged in successfully.`,
    })
  });
};

module.exports = doLogin;