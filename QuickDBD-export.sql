-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "Passengers" (
    "PassengerID" int64   NOT NULL,
    "Name" object   NOT NULL,
    "Sex" object   NOT NULL,
    "Age" float64   NOT NULL,
    "Survived" int64   NOT NULL,
    CONSTRAINT "pk_Passengers" PRIMARY KEY (
        "PassengerID"
     )
);

CREATE TABLE "Ticket" (
    "Ticket" object   NOT NULL,
    "PassengerID" int64   NOT NULL,
    "Fare" float64   NOT NULL,
    CONSTRAINT "pk_Ticket" PRIMARY KEY (
        "Ticket"
     )
);

CREATE TABLE "Embarked" (
    "Embarked" object   NOT NULL,
    "Ticket" object   NOT NULL,
    CONSTRAINT "pk_Embarked" PRIMARY KEY (
        "Embarked"
     )
);

CREATE TABLE "Relatives" (
    "PassengerD" int64   NOT NULL,
    "SibSp" int64   NOT NULL,
    "Parch" int64   NOT NULL,
    CONSTRAINT "pk_Relatives" PRIMARY KEY (
        "PassengerD"
     )
);

CREATE TABLE "CabinClass" (
    "Ticket" object   NOT NULL,
    "PClass" int64   NOT NULL,
    "Cabin" object   NOT NULL
);

ALTER TABLE "Ticket" ADD CONSTRAINT "fk_Ticket_PassengerID" FOREIGN KEY("PassengerID")
REFERENCES "Passengers" ("PassengerID");

ALTER TABLE "Embarked" ADD CONSTRAINT "fk_Embarked_Ticket" FOREIGN KEY("Ticket")
REFERENCES "Ticket" ("Ticket");

ALTER TABLE "Relatives" ADD CONSTRAINT "fk_Relatives_PassengerD" FOREIGN KEY("PassengerD")
REFERENCES "Passengers" ("PassengerID");

ALTER TABLE "CabinClass" ADD CONSTRAINT "fk_CabinClass_Ticket" FOREIGN KEY("Ticket")
REFERENCES "Ticket" ("Ticket");

