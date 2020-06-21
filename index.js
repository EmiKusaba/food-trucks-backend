const express = require("express");
const app = express();

const bodyParser = require('body-parser');
app.use(bodyParser.json()); // support json encoded bodies
app.use(bodyParser.urlencoded({ extended: true })); // support encoded bodies

const trucksRouter = require("./routes/trucks");
const usersRouter = require("./routes/users");

const port = process.env.PORT || 4001;

app.get("/", (req, res) => {
  res.send("Welcome to food-trucks-backend!");
});

app.use("/trucks", trucksRouter);
app.use("/users", usersRouter);

app.listen(port, () => {
  console.log(`Web server listening on ${port}`);
});

