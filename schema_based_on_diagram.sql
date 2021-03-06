CREATE TABLE patients ( id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY, name VARCHAR(200), date_of_birth DATE);

CREATE TABLE medical_histories( id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY, addmited_at DATE, patient_id INT, status VARCHAR(255), CONSTRAINT patient_id_fk FOREIGN KEY (patient_id) REFERENCES patients(id) );

CREATE TABLE invoices (id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY, total_amount DECIMAL, generated_at DATE, paid_at DATE, medical_history_id INT, CONSTRAINT medical_history_id_FK FOREIGN KEY medical_history_id REFERENCES medical_histories(id));

CREATE TABLE treatments(id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY, type VARCHAR(200), name VARCHAR(200) );

CREATE TABLE mhistory_treatment(medical_history_id INT, treatment_id INT, CONSTRAINT medical_history_id_FK FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id), CONSTRAINT treatment_id_FK FOREIGN KEY treatment_id REFERENCES treatments(id));

CREATE TABLE invoice_items( id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY, unit_price DECIMAL, quantity INT, total_price DECIMAL, invoice_id INT, treatment_id INT, CONSTRAINT invoice_id_FK FOREIGN KEY invoice_id REFERENCES invoices(id), CONSTRAINT treatment_id_FK FOREIGN KEY treatment_id REFERENCES treatments(id));