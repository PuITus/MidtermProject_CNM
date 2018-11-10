var db = require('../fn/mysql-db');

exports.loadAll = () => {
	var sql = 'select * from requests';
	return db.load(sql);
}
exports.getUnlocated = () => {
	var sql = 'select * from requests where Status = 0 limit 1';
	return db.load(sql);
}
exports.setStatus = (ID,Status) => {
	var sql = `
    UPDATE requests
SET Status = '${Status}' WHERE ID = '${ID}';`;
	return db.load(sql);
}
exports.setDriver = (ID,Driver_ID) => {
	var sql = `
    UPDATE requests
SET Status = '3', Driver_ID = '${Driver_ID}' WHERE ID = '${ID}';`;
	return db.load(sql);
}
exports.load = () => {
	var sql = 'select * from requests where Status = 0';
	return db.load(sql);
}
exports.getByID = (ID) => {
	var sql = `select * from requests where ID = ${ID}`;
	return db.load(sql);
}
exports.updateAttitude = (Latitude,Longitude,ID) =>
{
    var sql = `
    UPDATE requests
SET Latitude = '${Latitude}', Longitude = '${Longitude}',Status = 2 WHERE ID = '${ID}';`;
    return db.insert(sql);
}
exports.add = requestEntity => {


    var sql = `insert into requests(Name, Phone, Adress, Note, Status,Latitude, Longitude) values('${requestEntity.Name}', '${requestEntity.Phone}','${requestEntity.Adress}','${requestEntity.Note}','0','${requestEntity.Latitude}','${requestEntity.Longitude}')`;
   return db.insert(sql);

}