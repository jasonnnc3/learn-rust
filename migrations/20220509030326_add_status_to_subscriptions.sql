--  todo: configure data source for local docker db in intellij

ALTER TABLE subscriptions
    ADD COLUMN status TEXT NULL;-- Add migration script here
