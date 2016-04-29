CREATE SEQUENCE "ACTIVE_ADMIN_COMMENTS_SEQ"

/

CREATE SEQUENCE "ADMIN_USERS_SEQ"

/

CREATE SEQUENCE "CATEGORIES_SEQ"

/

CREATE SEQUENCE "EVENTS_SEQ"

/

CREATE SEQUENCE "PAYMENTS_SEQ"

/

CREATE SEQUENCE "USER_EVENTS_SEQ"

/

CREATE SEQUENCE "USERS_SEQ"

/

CREATE TABLE "ACTIVE_ADMIN_COMMENTS" (
"ID" NUMBER(38,0) NOT NULL,
 "NAMESPACE" VARCHAR2(255),
 "BODY" CLOB,
 "RESOURCE_ID" VARCHAR2(255) NOT NULL,
 "RESOURCE_TYPE" VARCHAR2(255) NOT NULL,
 "AUTHOR_ID" NUMBER(38,0),
 "AUTHOR_TYPE" VARCHAR2(255),
 "CREATED_AT" DATE,
 "UPDATED_AT" DATE,
 CONSTRAINT SYS_C007282 PRIMARY KEY (ID)
)

/

CREATE  INDEX "I_ACT_ADM_COM_AUT_TYP_AUT_ID" ON "ACTIVE_ADMIN_COMMENTS" ("AUTHOR_TYPE", "AUTHOR_ID")

/

CREATE  INDEX "I_ACT_ADM_COM_NAM" ON "ACTIVE_ADMIN_COMMENTS" ("NAMESPACE")

/

CREATE  INDEX "I_ACT_ADM_COM_RES_TYP_RES_ID" ON "ACTIVE_ADMIN_COMMENTS" ("RESOURCE_TYPE", "RESOURCE_ID")

/



/



/



/

CREATE TABLE "ADMIN_USERS" (
"ID" NUMBER(38,0) NOT NULL,
 "EMAIL" VARCHAR2(255) DEFAULT ''  NOT NULL,
 "ENCRYPTED_PASSWORD" VARCHAR2(255) DEFAULT ''  NOT NULL,
 "RESET_PASSWORD_TOKEN" VARCHAR2(255),
 "RESET_PASSWORD_SENT_AT" DATE,
 "REMEMBER_CREATED_AT" DATE,
 "SIGN_IN_COUNT" NUMBER(38,0) DEFAULT 0  NOT NULL,
 "CURRENT_SIGN_IN_AT" DATE,
 "LAST_SIGN_IN_AT" DATE,
 "CURRENT_SIGN_IN_IP" VARCHAR2(255),
 "LAST_SIGN_IN_IP" VARCHAR2(255),
 "CREATED_AT" DATE NOT NULL,
 "UPDATED_AT" DATE NOT NULL,
 CONSTRAINT SYS_C007276 PRIMARY KEY (ID)
)

/

CREATE UNIQUE INDEX "I_ADM_USE_RES_PAS_TOK" ON "ADMIN_USERS" ("RESET_PASSWORD_TOKEN")

/

CREATE UNIQUE INDEX "INDEX_ADMIN_USERS_ON_EMAIL" ON "ADMIN_USERS" ("EMAIL")

/

ALTER TABLE ADMIN_USERS ADD CONSTRAINT INDEX_ADMIN_USERS_ON_EMAIL UNIQUE (EMAIL)

/

ALTER TABLE ADMIN_USERS ADD CONSTRAINT I_ADM_USE_RES_PAS_TOK UNIQUE (RESET_PASSWORD_TOKEN)

/



/



/

CREATE TABLE "CATEGORIES" (
"ID" NUMBER(38,0) NOT NULL,
 "NAME" VARCHAR2(255),
 "CREATED_AT" DATE NOT NULL,
 "UPDATED_AT" DATE NOT NULL,
 CONSTRAINT SYS_C007248 PRIMARY KEY (ID)
)

/



/



/



/



/

CREATE TABLE "EVENTS" (
"ID" NUMBER(38,0) NOT NULL,
 "CATEGORY_ID" NUMBER(38,0),
 "EVENT_TIME" DATE,
 "CREATED_AT" DATE NOT NULL,
 "UPDATED_AT" DATE NOT NULL,
 CONSTRAINT SYS_C007265 PRIMARY KEY (ID)
)

/

CREATE  INDEX "INDEX_EVENTS_ON_CATEGORY_ID" ON "EVENTS" ("CATEGORY_ID")

/



/



/



/

CREATE TABLE "PAYMENTS" (
"ID" NUMBER(38,0) NOT NULL,
 "USER_ID" NUMBER(38,0),
 "MONTH_REFERENCE" DATE,
 "PAYMENT_DATE" DATE,
 "CREATED_AT" DATE NOT NULL,
 "UPDATED_AT" DATE NOT NULL,
 CONSTRAINT SYS_C007261 PRIMARY KEY (ID)
)

/

CREATE  INDEX "INDEX_PAYMENTS_ON_USER_ID" ON "PAYMENTS" ("USER_ID")

/



/



/



/

CREATE TABLE "SCHEMA_MIGRATIONS" (
"VERSION" VARCHAR2(255) NOT NULL
)

/

CREATE UNIQUE INDEX "UNIQUE_SCHEMA_MIGRATIONS" ON "SCHEMA_MIGRATIONS" ("VERSION")

/

ALTER TABLE SCHEMA_MIGRATIONS ADD CONSTRAINT UNIQUE_SCHEMA_MIGRATIONS UNIQUE (VERSION)

/



/



/

CREATE TABLE "USER_EVENTS" (
"ID" NUMBER(38,0) NOT NULL,
 "USER_ID" NUMBER(38,0),
 "EVENT_ID" NUMBER(38,0),
 "TIMESTAMP" TIMESTAMP(6),
 "CREATED_AT" DATE NOT NULL,
 "UPDATED_AT" DATE NOT NULL,
 CONSTRAINT SYS_C007269 PRIMARY KEY (ID)
)

/

CREATE  INDEX "INDEX_USER_EVENTS_ON_EVENT_ID" ON "USER_EVENTS" ("EVENT_ID")

/

CREATE  INDEX "INDEX_USER_EVENTS_ON_USER_ID" ON "USER_EVENTS" ("USER_ID")

/



/



/



/

CREATE TABLE "USERS" (
"ID" NUMBER(38,0) NOT NULL,
 "EMAIL" VARCHAR2(255) DEFAULT ''  NOT NULL,
 "ENCRYPTED_PASSWORD" VARCHAR2(255) DEFAULT ''  NOT NULL,
 "RESET_PASSWORD_TOKEN" VARCHAR2(255),
 "RESET_PASSWORD_SENT_AT" DATE,
 "REMEMBER_CREATED_AT" DATE,
 "SIGN_IN_COUNT" NUMBER(38,0) DEFAULT 0  NOT NULL,
 "CURRENT_SIGN_IN_AT" DATE,
 "LAST_SIGN_IN_AT" DATE,
 "CURRENT_SIGN_IN_IP" VARCHAR2(255),
 "LAST_SIGN_IN_IP" VARCHAR2(255),
 "CREATED_AT" DATE NOT NULL,
 "UPDATED_AT" DATE NOT NULL,
 "NAME" VARCHAR2(255),
 CONSTRAINT SYS_C007255 PRIMARY KEY (ID)
)

/

CREATE UNIQUE INDEX "INDEX_USERS_ON_EMAIL" ON "USERS" ("EMAIL")

/

CREATE UNIQUE INDEX "I_USERS_RESET_PASSWORD_TOKEN" ON "USERS" ("RESET_PASSWORD_TOKEN")

/

ALTER TABLE USERS ADD CONSTRAINT INDEX_USERS_ON_EMAIL UNIQUE (EMAIL)

/

ALTER TABLE USERS ADD CONSTRAINT I_USERS_RESET_PASSWORD_TOKEN UNIQUE (RESET_PASSWORD_TOKEN)

/



/



/

ALTER TABLE "EVENTS" ADD CONSTRAINT "FK_RAILS_FD5598A81D" FOREIGN KEY ("CATEGORY_ID") REFERENCES "CATEGORIES"("ID")

/

ALTER TABLE "PAYMENTS" ADD CONSTRAINT "FK_RAILS_081DC04A02" FOREIGN KEY ("USER_ID") REFERENCES "USERS"("ID")

/

ALTER TABLE "USER_EVENTS" ADD CONSTRAINT "FK_RAILS_1B0B06BBC7" FOREIGN KEY ("EVENT_ID") REFERENCES "EVENTS"("ID")

/

ALTER TABLE "USER_EVENTS" ADD CONSTRAINT "FK_RAILS_717CCF5F73" FOREIGN KEY ("USER_ID") REFERENCES "USERS"("ID")

/

INSERT INTO schema_migrations (version) VALUES ('20160429164535')

/

INSERT INTO schema_migrations (version) VALUES ('20160429170446')

/

INSERT INTO schema_migrations (version) VALUES ('20160429171756')

/

INSERT INTO schema_migrations (version) VALUES ('20160429172053')

/

INSERT INTO schema_migrations (version) VALUES ('20160429172213')

/

INSERT INTO schema_migrations (version) VALUES ('20160429173008')

/

INSERT INTO schema_migrations (version) VALUES ('20160429173227')

/

INSERT INTO schema_migrations (version) VALUES ('20160429173229')

/

INSERT INTO schema_migrations (version) VALUES ('20160429173607')

/

INSERT INTO schema_migrations (version) VALUES ('20160429173830')

/


