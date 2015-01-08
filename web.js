var express = require('express');

var app = express();

app.use(express.static("" + __dirname + "/bin"));
app.use("/vendor", express.static(__dirname + '/bin/vendor'));
app.listen(process.env.PORT || 5000);