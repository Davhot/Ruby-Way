require 'sqlite3'

db = SQLite3::Database.open("library.db")

create_sql = %q(
  CREATE TABLE books(
    title varchar(1024),
    author varchar(256)
  );
)
db.execute create_sql

{
  "Robert Zubrin" => "The Case for Mars"
}.each do |author, title|
  db.execute "INSERT INTO books VALUES (?, ?)", [title, author]
end

db.execute("SELECT title, author FROM books") do |row|
  p row
end

db.close
