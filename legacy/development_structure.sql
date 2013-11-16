CREATE TABLE "articles_tags" ("article_id" integer, "tag_id" integer);
CREATE TABLE "blogs" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "settings" text, "base_url" varchar(255));
CREATE TABLE "categories" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "position" integer, "permalink" varchar(255), "keywords" text, "description" text, "parent_id" integer);
CREATE TABLE "categorizations" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "article_id" integer, "category_id" integer, "is_primary" boolean);
CREATE TABLE "contents" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "type" varchar(255), "title" varchar(255), "author" varchar(255), "body" text, "extended" text, "excerpt" text, "created_at" datetime, "updated_at" datetime, "user_id" integer, "permalink" varchar(255), "guid" varchar(255), "text_filter_id" integer, "whiteboard" text, "name" varchar(255), "published" boolean DEFAULT 'f', "allow_pings" boolean, "allow_comments" boolean, "published_at" datetime, "state" varchar(255), "parent_id" integer, "settings" text, "post_type" varchar(255) DEFAULT 'read');
CREATE TABLE "feedback" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "type" varchar(255), "title" varchar(255), "author" varchar(255), "body" text, "excerpt" text, "created_at" datetime, "updated_at" datetime, "user_id" integer, "guid" varchar(255), "text_filter_id" integer, "whiteboard" text, "article_id" integer, "email" varchar(255), "url" varchar(255), "ip" varchar(40), "blog_name" varchar(255), "published" boolean DEFAULT 'f', "published_at" datetime, "state" varchar(255), "status_confirmed" boolean);
CREATE TABLE "notifications" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "content_id" integer, "user_id" integer, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "page_caches" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255));
CREATE TABLE "pings" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "article_id" integer, "url" varchar(255), "created_at" datetime);
CREATE TABLE "post_types" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "permalink" varchar(255), "description" varchar(255));
CREATE TABLE "profiles" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "label" varchar(255), "nicename" varchar(255), "modules" text);
CREATE TABLE "profiles_rights" ("profile_id" integer, "right_id" integer);
CREATE TABLE "redirections" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "content_id" integer, "redirect_id" integer);
CREATE TABLE "redirects" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "from_path" varchar(255), "to_path" varchar(255), "origin" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "resources" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "size" integer, "filename" varchar(255), "mime" varchar(255), "created_at" datetime, "updated_at" datetime, "article_id" integer, "itunes_metadata" boolean, "itunes_author" varchar(255), "itunes_subtitle" varchar(255), "itunes_duration" integer, "itunes_summary" text, "itunes_keywords" varchar(255), "itunes_category" varchar(255), "itunes_explicit" boolean);
CREATE TABLE "rights" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "description" varchar(255));
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "sidebars" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "active_position" integer, "config" text, "staged_position" integer, "type" varchar(255));
CREATE TABLE "sitealizer" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "path" varchar(255), "ip" varchar(255), "referer" varchar(255), "language" varchar(255), "user_agent" varchar(255), "created_at" datetime, "created_on" date);
CREATE TABLE "tags" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "created_at" datetime, "updated_at" datetime, "display_name" varchar(255));
CREATE TABLE "text_filters" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "description" varchar(255), "markup" varchar(255), "filters" text, "params" text);
CREATE TABLE "triggers" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "pending_item_id" integer, "pending_item_type" varchar(255), "due_at" datetime, "trigger_method" varchar(255));
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "login" varchar(255), "password" varchar(255), "email" text, "name" text, "notify_via_email" boolean, "notify_on_new_articles" boolean, "notify_on_comments" boolean, "profile_id" integer, "remember_token" varchar(255), "remember_token_expires_at" datetime, "text_filter_id" varchar(255) DEFAULT '1', "state" varchar(255) DEFAULT 'active', "last_connection" datetime, "settings" text);
CREATE INDEX "index_categories_on_permalink" ON "categories" ("permalink");
CREATE INDEX "index_contents_on_published" ON "contents" ("published");
CREATE INDEX "index_contents_on_text_filter_id" ON "contents" ("text_filter_id");
CREATE INDEX "index_feedback_on_article_id" ON "feedback" ("article_id");
CREATE INDEX "index_feedback_on_text_filter_id" ON "feedback" ("text_filter_id");
CREATE INDEX "index_page_caches_on_name" ON "page_caches" ("name");
CREATE INDEX "index_pings_on_article_id" ON "pings" ("article_id");
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('1');

INSERT INTO schema_migrations (version) VALUES ('2');

INSERT INTO schema_migrations (version) VALUES ('3');

INSERT INTO schema_migrations (version) VALUES ('4');

INSERT INTO schema_migrations (version) VALUES ('5');

INSERT INTO schema_migrations (version) VALUES ('6');

INSERT INTO schema_migrations (version) VALUES ('7');

INSERT INTO schema_migrations (version) VALUES ('8');

INSERT INTO schema_migrations (version) VALUES ('9');

INSERT INTO schema_migrations (version) VALUES ('10');

INSERT INTO schema_migrations (version) VALUES ('11');

INSERT INTO schema_migrations (version) VALUES ('12');

INSERT INTO schema_migrations (version) VALUES ('13');

INSERT INTO schema_migrations (version) VALUES ('14');

INSERT INTO schema_migrations (version) VALUES ('15');

INSERT INTO schema_migrations (version) VALUES ('16');

INSERT INTO schema_migrations (version) VALUES ('17');

INSERT INTO schema_migrations (version) VALUES ('18');

INSERT INTO schema_migrations (version) VALUES ('19');

INSERT INTO schema_migrations (version) VALUES ('20');

INSERT INTO schema_migrations (version) VALUES ('21');

INSERT INTO schema_migrations (version) VALUES ('22');

INSERT INTO schema_migrations (version) VALUES ('23');

INSERT INTO schema_migrations (version) VALUES ('24');

INSERT INTO schema_migrations (version) VALUES ('25');

INSERT INTO schema_migrations (version) VALUES ('26');

INSERT INTO schema_migrations (version) VALUES ('27');

INSERT INTO schema_migrations (version) VALUES ('28');

INSERT INTO schema_migrations (version) VALUES ('29');

INSERT INTO schema_migrations (version) VALUES ('30');

INSERT INTO schema_migrations (version) VALUES ('31');

INSERT INTO schema_migrations (version) VALUES ('32');

INSERT INTO schema_migrations (version) VALUES ('33');

INSERT INTO schema_migrations (version) VALUES ('34');

INSERT INTO schema_migrations (version) VALUES ('35');

INSERT INTO schema_migrations (version) VALUES ('36');

INSERT INTO schema_migrations (version) VALUES ('37');

INSERT INTO schema_migrations (version) VALUES ('38');

INSERT INTO schema_migrations (version) VALUES ('39');

INSERT INTO schema_migrations (version) VALUES ('40');

INSERT INTO schema_migrations (version) VALUES ('41');

INSERT INTO schema_migrations (version) VALUES ('42');

INSERT INTO schema_migrations (version) VALUES ('43');

INSERT INTO schema_migrations (version) VALUES ('44');

INSERT INTO schema_migrations (version) VALUES ('45');

INSERT INTO schema_migrations (version) VALUES ('46');

INSERT INTO schema_migrations (version) VALUES ('47');

INSERT INTO schema_migrations (version) VALUES ('48');

INSERT INTO schema_migrations (version) VALUES ('49');

INSERT INTO schema_migrations (version) VALUES ('50');

INSERT INTO schema_migrations (version) VALUES ('51');

INSERT INTO schema_migrations (version) VALUES ('52');

INSERT INTO schema_migrations (version) VALUES ('53');

INSERT INTO schema_migrations (version) VALUES ('54');

INSERT INTO schema_migrations (version) VALUES ('55');

INSERT INTO schema_migrations (version) VALUES ('56');

INSERT INTO schema_migrations (version) VALUES ('57');

INSERT INTO schema_migrations (version) VALUES ('58');

INSERT INTO schema_migrations (version) VALUES ('59');

INSERT INTO schema_migrations (version) VALUES ('60');

INSERT INTO schema_migrations (version) VALUES ('61');

INSERT INTO schema_migrations (version) VALUES ('62');

INSERT INTO schema_migrations (version) VALUES ('63');

INSERT INTO schema_migrations (version) VALUES ('64');

INSERT INTO schema_migrations (version) VALUES ('65');

INSERT INTO schema_migrations (version) VALUES ('66');

INSERT INTO schema_migrations (version) VALUES ('67');

INSERT INTO schema_migrations (version) VALUES ('68');

INSERT INTO schema_migrations (version) VALUES ('69');

INSERT INTO schema_migrations (version) VALUES ('70');

INSERT INTO schema_migrations (version) VALUES ('71');

INSERT INTO schema_migrations (version) VALUES ('72');

INSERT INTO schema_migrations (version) VALUES ('73');

INSERT INTO schema_migrations (version) VALUES ('74');

INSERT INTO schema_migrations (version) VALUES ('75');

INSERT INTO schema_migrations (version) VALUES ('76');

INSERT INTO schema_migrations (version) VALUES ('77');

INSERT INTO schema_migrations (version) VALUES ('78');

INSERT INTO schema_migrations (version) VALUES ('79');

INSERT INTO schema_migrations (version) VALUES ('80');

INSERT INTO schema_migrations (version) VALUES ('81');

INSERT INTO schema_migrations (version) VALUES ('82');

INSERT INTO schema_migrations (version) VALUES ('83');

INSERT INTO schema_migrations (version) VALUES ('84');

INSERT INTO schema_migrations (version) VALUES ('85');

INSERT INTO schema_migrations (version) VALUES ('86');

INSERT INTO schema_migrations (version) VALUES ('87');

INSERT INTO schema_migrations (version) VALUES ('88');

INSERT INTO schema_migrations (version) VALUES ('89');

INSERT INTO schema_migrations (version) VALUES ('90');

INSERT INTO schema_migrations (version) VALUES ('91');

INSERT INTO schema_migrations (version) VALUES ('92');

INSERT INTO schema_migrations (version) VALUES ('93');

INSERT INTO schema_migrations (version) VALUES ('94');

INSERT INTO schema_migrations (version) VALUES ('95');

INSERT INTO schema_migrations (version) VALUES ('96');

INSERT INTO schema_migrations (version) VALUES ('97');

INSERT INTO schema_migrations (version) VALUES ('98');

INSERT INTO schema_migrations (version) VALUES ('99');

INSERT INTO schema_migrations (version) VALUES ('100');

INSERT INTO schema_migrations (version) VALUES ('101');

INSERT INTO schema_migrations (version) VALUES ('102');

INSERT INTO schema_migrations (version) VALUES ('103');

INSERT INTO schema_migrations (version) VALUES ('104');