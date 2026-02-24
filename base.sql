-- Membuat tabel
CREATE TABLE "BOOK" (
    "id" SERIAL PRIMARY KEY,
    "book_title" VARCHAR(40),
    "author" VARCHAR(120),
    "year" INTEGER,
    "publisher" INTEGER,
    "city" VARCHAR(50)
);

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

CREATE TABLE book_category (
    id INTEGER PRIMARY KEY,
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

-- Melihat isian tabel
SELECT * FROM "BOOK";
SELECT * FROM "BOOKSHELF";
SELECT * FROM "CATEGORY";
SELECT * FROM "OFFICER";
SELECT * FROM "BORROWER";
SELECT * FROM book_category;

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

ALTER TABLE "BOOK"
ADD COLUMN "category_id" SERIAL

ALTER TABLE "BOOK"
ADD CONSTRAINT fk_category
FOREIGN KEY ("category_id")
REFERENCES "CATEGORY" ("id")
ON DELETE SET NULL;

ALTER TABLE "BOOK"
ADD COLUMN "borrower_id" INTEGER

ALTER TABLE "BOOK"
ADD CONSTRAINT fk_borrower
FOREIGN KEY ("borrower_id")
REFERENCES "BORROWER" ("id");

ALTER TABLE "BOOK"
ADD COLUMN "officer_id" INTEGER

ALTER TABLE "BOOK"
ADD CONSTRAINT fk_officer
FOREIGN KEY ("officer_id")
REFERENCES "OFFICER" ("id")
ON DELETE SET NULL;

-- //TODO: (perlu membuat value tabel lain)
-- Mengisi data ke column table BOOK
-- Salah tipe data kolom publisher, ubah ke varchar
ALTER TABLE "BOOK"
ALTER COLUMN "publisher" TYPE VARCHAR(100)

INSERT INTO "BOOK" ("book_title", "author", "year", "publisher", "city", "bookshelf_id", "category_id", "borrower_id", "officer_id")
VALUES ('The Psycholgy of Leadership', 'Sebastian Page', 2025, 'Penerbit Baca', 'Tangerang Selatan', 'B-04', 1, 678001, 987003);

-- akhir //TODO

-- Mengisi tabel category
INSERT INTO "CATEGORY" ("category_name")
VALUES ('leadership');

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

-- Mengisi tabel bookshelf
INSERT INTO "BOOKSHELF" ("id")
VALUES ('B-04')