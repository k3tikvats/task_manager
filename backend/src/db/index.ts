//in drizzle this is how we connect to the database

import { drizzle } from "drizzle-orm/node-postgres";
import { Pool } from "pg";//this is the only task of pg throughout our codebase-just used for connection to our db

const pool =new Pool({
    connectionString: "postgresql://postgres:test123@db:5432/mydb",
});

export const db=drizzle(pool);
//also do this export default drizzle(pool); instead of creating a variable and then exporting it


//so whenever u have to access the db u can import it from index.ts 
//and this (export deafult drizzle(pool)) is the only thing that will show up that is exported by deafult
//but use export const db=drizzle(pool); instead of export default drizzle(pool);
//coz u will be more specific by your naming and it will be easier to understand when there will be multiple things getting exported
//THERE CAN ONLY BE ONE DEFAULT EXPORT IN A FILE
//and it is not necessary to use export default