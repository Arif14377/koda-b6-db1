-- Membuat tabel
CREATE TABLE "BOOK" (
    "id" SERIAL PRIMARY KEY,
    "book_title" VARCHAR(40),
    "author" VARCHAR(120),
    "year" INTEGER,
    "publisher" INTEGER,
    "city" VARCHAR(50)
);

-- HAPUS tabel dulu (reset)
drop table "BOOKSHELF" cascade;

CREATE TABLE "BOOKSHELF" (
    "id" VARCHAR(5) PRIMARY KEY
);

CREATE TABLE "OFFICER" (
    "id" INTEGER PRIMARY KEY,
    "name" VARCHAR(120)
);

CREATE TABLE "CATEGORY" (
    "id" SERIAL PRIMARY KEY,
    "category_name" VARCHAR(60)
);

CREATE TABLE "BORROWER" (
    "id" INTEGER PRIMARY KEY,
    "borrower_name" VARCHAR(120)
);

drop table book_category cascade;

CREATE TABLE book_category (
    id SERIAL PRIMARY KEY,
    book_id INTEGER,
    category_id INTEGER,
    -- membuat foreign key langsung
    CONSTRAINT fk_book
        FOREIGN KEY (book_id)
        REFERENCES "BOOK"(id),
    CONSTRAINT fk_category
        FOREIGN KEY (category_id)
        REFERENCES "CATEGORY"(id)
);

-- hapus kolom id pada table book_category
alter table book_category
drop column id;
-- menambahkan kolom id dengan serial
alter table book_category
add column id SERIAL primary key;

-- hapus table borrowed_book
drop table borrowed_book cascade;

create table borrowed_book (
    id SERIAL primary key,
    book_id INTEGER,
    borrower_id INTEGER,
    officer_id INTEGER,

    CONSTRAINT fk_book
        FOREIGN KEY (book_id)
        REFERENCES "BOOK"(id),
    CONSTRAINT fk_borrower
        FOREIGN KEY (borrower_id)
        REFERENCES "BORROWER"(id),
    CONSTRAINT fk_officer
        foreign key (officer_id)
        references "OFFICER" (id)
);

-- Melihat isian tabel
SELECT * FROM "BOOK";
SELECT * FROM "BOOKSHELF";
SELECT * FROM "CATEGORY";
SELECT * FROM "OFFICER";
SELECT * FROM "BORROWER";
SELECT * FROM book_category;
SELECT * FROM borrowed_book;

-- Menambahkan properti (foreign key) ke tabel BOOK
ALTER TABLE "BOOK"
ADD COLUMN "bookshelf_id" INTEGER;

-- Salah tipe data saat menambahkan properti, ubah tipe data:
ALTER TABLE "BOOK"
ALTER COLUMN "bookshelf_id" TYPE VARCHAR(5)

-- Membuat relasi column di tabel BOOK
ALTER TABLE "BOOK"
ADD CONSTRAINT fk_bookshelf
FOREIGN KEY ("bookshelf_id")
REFERENCES "BOOKSHELF" ("id")
ON DELETE SET NULL;

-- hapus fk_bookshelf (pindah ke table BOOKSHELF)
alter table "BOOK"
drop column bookshelf_id cascade;

alter table "BOOKSHELF"
add column "book_id" int;

-- TODO run
alter table "BOOKSHELF"
add constraint fk_book
    foreign key ("book_id")
    references "BOOK" (id);

ALTER TABLE "BOOK"
ADD COLUMN "category_id" SERIAL

ALTER TABLE "BOOK"
ADD CONSTRAINT fk_category
FOREIGN KEY ("category_id")
REFERENCES "CATEGORY" ("id")
ON DELETE SET NULL;

-- delete column fk category_id
alter table "BOOK"
drop column category_id cascade;

ALTER TABLE "BOOK"
ADD COLUMN "borrower_id" INTEGER

ALTER TABLE "BOOK"
ADD CONSTRAINT fk_borrower
FOREIGN KEY ("borrower_id")
REFERENCES "BORROWER" ("id");

-- delete fk borrower_id
alter table "BOOK"
drop column borrower_id cascade;

ALTER TABLE "BOOK"
ADD COLUMN "officer_id" INTEGER

ALTER TABLE "BOOK"
ADD CONSTRAINT fk_officer
FOREIGN KEY ("officer_id")
REFERENCES "OFFICER" ("id")
ON DELETE SET NULL;

-- delete fk officer_id
alter table "BOOK"
drop column officer_id cascade;

-- //TODO: (perlu membuat value tabel lain)
-- Mengisi data ke column table BOOK
-- Salah tipe data kolom publisher, ubah ke varchar
ALTER TABLE "BOOK"
ALTER COLUMN "publisher" TYPE VARCHAR(100);

ALTER TABLE "BOOK"
ALTER COLUMN "book_title" TYPE VARCHAR(120);

-- ('The Psycholgy of Leadership', 'Sebastian Page', 2025, 'Penerbit Baca', 'Tangerang Selatan', 'B-04', 1, 678001, 987003);
INSERT INTO "BOOK" ("book_title", "author", "year", "publisher", "city")
VALUES
('The Psycholgy of Leadership', 'Sebastian Page', 2025, 'Penerbit Baca', 'Tangerang Selatan'),
('Laskar Pelangi', 'Andrea Hirata', 2005, 'Bentang Pustaka', 'Yogyakarta'),
('Bumi Manusia', 'Pramoedya Ananta Toer', 1980, 'Hasta Mitra', 'Jakarta'),
('Negeri 5 Menara', 'Ahmad Fuadi', 2009, 'Gramedia Pustaka Utama', 'Jakarta'),
('Ayat-Ayat Cinta', 'Habiburrahman El Shirazy', 2004, 'Republika', 'Jakarta'),
('Perahu Kertas', 'Dee Lestari', 2009, 'Bentang Pustaka', 'Yogyakarta'),
('Dilan 1990', 'Pidi Baiq', 2014, 'Pastel Books', 'Bandung'),
('Ronggeng Dukuh Paruk', 'Ahmad Tohari', 1982, 'Gramedia Pustaka Utama', 'Jakarta'),
('Cantik Itu Luka', 'Eka Kurniawan', 2002, 'Gramedia Pustaka Utama', 'Jakarta'),
('Supernova: Ksatria, Puteri, dan Bintang Jatuh', 'Dee Lestari', 2001, 'Truedee Books', 'Jakarta'),
('5 cm', 'Donny Dhirgantoro', 2005, 'Grasindo', 'Jakarta');

-- akhir //TODO

-- Mengisi tabel category
INSERT INTO "CATEGORY" ("category_name")
-- VALUES ('leadership');
VALUES ('fiction'),
       ('non-fiction'),
       ('science'),
       ('technology'),
       ('history'),
       ('biography'),
       ('self-development'),
       ('religion'),
       ('business'),
       ('education');

-- Mengisi tabel borrower
INSERT INTO "BORROWER" ("id", "borrower_name")
VALUES (678001, 'Ethan Walker')
INSERT INTO "BORROWER" ("id", "borrower_name")
VALUES (678002, 'Lucas Turner')
INSERT INTO "BORROWER" ("id", "borrower_name")
VALUES (678003, 'Sophia Carter')
INSERT INTO "BORROWER" ("id", "borrower_name")
VALUES (678004, 'Noah Mitchell')
INSERT INTO "BORROWER" ("id", "borrower_name")
VALUES (678005, 'Amelia Brooks')
INSERT INTO "BORROWER" ("id", "borrower_name")
VALUES (678006, 'Mason Reed')
INSERT INTO "BORROWER" ("id", "borrower_name")
VALUES (678007, 'Isabella Hayes')
INSERT INTO "BORROWER" ("id", "borrower_name")
VALUES (678008, 'Logan Foster')
INSERT INTO "BORROWER" ("id", "borrower_name")
VALUES (678009, 'Charlotte Price')
INSERT INTO "BORROWER" ("id", "borrower_name")
VALUES (678010, 'Olivia Bennett');

-- Mengisi tabel officer
INSERT INTO "OFFICER" ("id", "name")
VALUES ('987001', 'Sastro Wibowo')
INSERT INTO "OFFICER" ("id", "name")
VALUES ('987002', 'Parto Sumardi')
INSERT INTO "OFFICER" ("id", "name")
VALUES ('987003', 'Sastro Amidjojo')
INSERT INTO "OFFICER" ("id", "name")
VALUES ('987004', 'Bambang Nugroho')
INSERT INTO "OFFICER" ("id", "name")
VALUES ('987005', 'Siti Wulandari'),
       ('987006', 'Agus Setiawan'),
       ('987007', 'Rina Kartika'),
       ('987008', 'Dedi Pratama'),
       ('987009', 'Lestari Handayani'),
       ('987010', 'Hendra Saputra');

-- Mengisi tabel bookshelf
INSERT INTO "BOOKSHELF" ("id", "book_id")
-- VALUES ('B-04')
VALUES ('A-01', 2),
       ('A-02', 3),
       ('A-03', NULL),
       ('A-04', 6),
       ('A-05', 8),
       ('B-01', 11),
       ('B-02', NULL),
       ('B-03', 9),
       ('B-05', NULL),
       ('C-01', 4),
       ('C-02', 3),
       ('C-03', 2),
       ('C-04', NULL),
       ('C-05', 7),
       ('D-01', NULL),
       ('D-02', 5),
       ('D-03', NULL),
       ('D-04', NULL),
       ('D-05', 10);

-- mengisi tabel book_category
insert into book_category("book_id", "category_id")
values
(5, 4),
(4, 8),
(5, 2),
(5, 7),
(3, 3),
(2, 4),
(10, 6),
(7, 5),
(3, 2),
(6, 1);

INSERT INTO borrowed_book (book_id, borrower_id, officer_id)
VALUES
(3, 678002, 987004),
(7, 678005, 987001),
(3, 678010, 987003),
(12, 678001, 987006),
(5, 678008, 987002),
(9, 678003, 987009),
(4, 678007, 987005),
(11, 678006, 987010),
(2, 678004, 987008),
(13, 678009, 987007),
(6, 678002, 987003),
(8, 678005, 987004),
(10, 678001, 987002),
(3, 678006, 987009),
(7, 678008, 987001),
(2, 678003, 987006),
(12, 678010, 987005),
(5, 678004, 987007),
(9, 678007, 987008),
(4, 678009, 987010);