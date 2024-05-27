CREATE TABLE members_trainings (
    member_id UUID,
    training_id INTEGER NOT NULL,
    sign_up_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (member_id, training_id),
    CONSTRAINT fk_members_trainings_member FOREIGN KEY (member_id) REFERENCES members(member_id),
    CONSTRAINT fk_members_trainings_training FOREIGN KEY (training_id) REFERENCES trainings(training_id)
);

CREATE TABLE members_modules_validation (
    member_id UUID,
    module_id INTEGER NOT NULL,
    validation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (member_id, module_id),
    CONSTRAINT fk_members_modules_validation_member FOREIGN KEY (member_id) REFERENCES members(member_id),
    CONSTRAINT fk_members_modules_validation_module FOREIGN KEY (module_id) REFERENCES modules(module_id)
);