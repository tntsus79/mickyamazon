const mysql = require('mysql2/promise');

async function query(sql, params){
    const connection = await mysql.createConnection({
        host: "bsu-gimm260-fall-2021.cwtgn0g8zxfm.us-west-2.rds.amazonaws.com",
        user: "MylesHolley",
        password: "UCK2sEht0Hry8vqIsa7nnODQ58f012KOCx7",
        database: 'MylesHolley',
        connectionLimit: 2
    });

    const [results, ] =  await connection.execute(sql, params);

    return results;
}

module.exports = {
    query
}
