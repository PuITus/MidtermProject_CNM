var express = require('express'),
    bodyParser = require('body-parser'),
    morgan = require('morgan'),
    cors = require('cors');

var requestCtrl = require('./apiControllers/requestControllers');
var userCtrl = require('./apiControllers/userControllers');

var verifyAccessToken = require('./repos/authRepo').verifyAccessToken;

var app = express();

app.use(morgan('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: false
}));
app.use(cors());

app.get('/', (req, res) => {
    res.json({
        msg: 'hello from nodejs express api'
    })
});

app.use('/api/requests/',verifyAccessToken, requestCtrl);
app.use('/api/users/', userCtrl);
require('./TDVws')


var port = process.env.PORT || 3000;
app.listen(port, () => {
    console.log(`Uber API is running on port ${port}`);
})