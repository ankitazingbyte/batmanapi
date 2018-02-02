CREATE TABLE "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "menus" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "starter" varchar, "price" float, "salad" varchar, "soup" varchar, "pizza" varchar, "restaurant_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, CONSTRAINT "fk_rails_4d07a806b1"
FOREIGN KEY ("restaurant_id")
  REFERENCES "restaurants" ("id")
);
CREATE INDEX "index_menus_on_restaurant_id" ON "menus" ("restaurant_id");
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "provider" varchar DEFAULT 'email' NOT NULL, "uid" varchar DEFAULT '' NOT NULL, "encrypted_password" varchar DEFAULT '' NOT NULL, "reset_password_token" varchar, "reset_password_sent_at" datetime, "remember_created_at" datetime, "sign_in_count" integer DEFAULT 0 NOT NULL, "current_sign_in_at" datetime, "last_sign_in_at" datetime, "current_sign_in_ip" varchar, "last_sign_in_ip" varchar, "confirmation_token" varchar, "confirmed_at" datetime, "confirmation_sent_at" datetime, "unconfirmed_email" varchar, "name" varchar, "nickname" varchar, "email" varchar, "tokens" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "first_name" varchar, "last_name" varchar, "gender" varchar, "auth_token" varchar, "role" varchar);
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE UNIQUE INDEX "index_users_on_uid_and_provider" ON "users" ("uid", "provider");
CREATE UNIQUE INDEX "index_users_on_reset_password_token" ON "users" ("reset_password_token");
CREATE UNIQUE INDEX "index_users_on_confirmation_token" ON "users" ("confirmation_token");
CREATE TABLE "restaurants" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "address" varchar, "phone" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_users_on_auth_token" ON "users" ("auth_token");
INSERT INTO "schema_migrations" (version) VALUES
('20180201052842'),
('20180201064130'),
('20180201094436'),
('20180201121016');


