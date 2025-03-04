-- Copyright (C) 2016  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Intel and sold by Intel or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 16.1.0 Build 196 10/24/2016 SJ Lite Edition"
-- CREATED		"Sat Nov 09 12:25:17 2024"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY pipemult IS 
	PORT
	(
		clk1 :  IN  STD_LOGIC;
		wren :  IN  STD_LOGIC;
		dataa :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		datab :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
      wraddress:  IN   integer RANGE 0 to 31;
      rdaddress:   IN   integer RANGE 0 to 31;

		q :  OUT  STD_LOGIC_VECTOR(0 TO 15)
	);
END pipemult;

ARCHITECTURE bdf_type OF pipemult IS 

COMPONENT mult
	PORT(clock : IN STD_LOGIC;
		 dataa : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 datab : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 result : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT ram
	PORT(      clock: IN   std_logic;
      data:  IN   std_logic_vector (15 DOWNTO 0);
      wraddress:  IN   integer RANGE 0 to 31;
      rdaddress:   IN   integer RANGE 0 to 31;
      wren:    IN   std_logic;
      q:     OUT  std_logic_vector (15 DOWNTO 0)

	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(15 DOWNTO 0);


BEGIN 



b2v_inst : mult
PORT MAP(clock => clk1,
		 dataa => dataa,
		 datab => datab,
		 result => SYNTHESIZED_WIRE_0);


b2v_inst1 : ram
PORT MAP(clock => clk1,
		 wren => wren,
		 data => SYNTHESIZED_WIRE_0,
		 rdaddress => rdaddress,
		 wraddress => wraddress,
		 q => SYNTHESIZED_WIRE_1);


PROCESS(clk1)
BEGIN
IF (RISING_EDGE(clk1)) THEN
	q(0 TO 15) <= SYNTHESIZED_WIRE_1(15 DOWNTO 0);
END IF;
END PROCESS;


END bdf_type;