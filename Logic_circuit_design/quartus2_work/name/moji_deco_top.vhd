 --Top Module
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity moji_deco_top is
 port(CLK,STOP,RESET : in std_logic;
		LED0,LED1,LED2,LED3 : out std_logic_vector(7 downto 0));
end moji_deco_top;

architecture RTL of moji_deco_top is
 component peripheral_moji
 port ( clk, reset, stop : in std_logic;
 deco0, deco1, deco2, deco3 : out std_logic_vector(4 downto 0));
 end component;

 component conversion_ascii
 port (order :	in std_logic_vector(4 downto 0);
		ascii : out std_logic_vector(6 downto 0));
 end component;
 
 component decoder_7seg
 port ( ascii : in std_logic_vector(6 downto 0);
 seg : out std_logic_vector(7 downto 0));
 end component;

 signal S0, S1, S2, S3 : std_logic_vector(4 downto 0);
 signal A0, A1, A2, A3 : std_logic_vector(6 downto 0);

begin
 PERI: peripheral_moji port map ( clk,reset,stop,S0,S1,S2,S3 );
 CNV0: conversion_ascii port map ( S0, A0 );
 CNV1: conversion_ascii port map ( S1, A1 );
 CNV2: conversion_ascii port map ( S2, A2 );
 CNV3: conversion_ascii port map ( S3, A3 );
 DCD0: decoder_7seg port map ( A0, LED0 );
 DCD1: decoder_7seg port map ( A1, LED1 );
 DCD2: decoder_7seg port map ( A2, LED2 );
 DCD3: decoder_7seg port map ( A3, LED3 );
end RTL; 