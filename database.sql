//Guests Table Create Query:

CREATE TABLE guests (
    guest_id INT AUTO_INCREMENT PRIMARY KEY,
    guest_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL
);


//Rooms table create query:

CREATE TABLE rooms (
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    room_type VARCHAR(50) NOT NULL,
    price_per_nt DECIMAL(10, 2) NOT NULL,
    status VARCHAR(20) DEFAULT 'Available'
);


//bookings table create query:

CREATE TABLE bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    guest_id INT NOT NULL,
    room_id INT NOT NULL,
    check_in DATE NOT NULL,
    check_out DATE NOT NULL,
    FOREIGN KEY (guest_id) REFERENCES guests(guest_id),
    FOREIGN KEY (room_id) REFERENCES rooms(room_id)
);


//Insert query guests:
INSERT INTO guests (guest_name, phone) VALUES 
('Rahul Patil', '9876543210'), 
('Pooja Shinde', '8765432109'), 
('Amit Deshmukh', '7654321098');

//Insert query rooms:
INSERT INTO rooms (room_type, price_per_nt, status) VALUES 
('Single', 1500.00, 'Available'), 
('Double', 2500.00, 'Available'), 
('Deluxe', 4000.00, 'Available');

//Insert query bookings:
INSERT INTO bookings (guest_id, room_id, check_in, check_out) VALUES 
(1, 2, '2026-09-10', '2026-09-13'), 
(2, 1, '2026-09-12', '2026-09-15');