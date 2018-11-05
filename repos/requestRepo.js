var db = require('../fn/mysql-db');

exports.loadAll = () => {
	var sql = 'select * from requests';
	return db.load(sql);
}
exports.add = requestEntity => {
    var sql = `insert into requests(Name, Phone, Adress, Note, Status) values('${requestEntity.Name}', '${requestEntity.Phone}','${requestEntity.Adress}','${requestEntity.Note}','0')`;
    return db.insert(sql);
}