entity last_value is
end entity;

architecture test of last_value is
    signal x : integer := 5;
    signal y : bit_vector(0 to 3);
begin

    process is
    begin
        x <= 0;
        assert x'last_value = x;
        assert x'last_value = 5;
        wait for 1 ns;
        assert x'last_value = 5;
        x <= 2;
        wait for 1 ns;
        assert x = 2;
        assert x'last_value = 0;

        assert y'last_value = y;
        y <= ( '0', '1', '0', '1' );
        wait for 1 ns;
        assert y'last_value = ( '0', '0', '0', '0' );
        y(1) <= '1';
        wait for 1 ns;
        assert y'last_value = ( '0', '0', '0', '0' );
        y(1) <= '0';
        wait for 1 ns;
        assert y'last_value = ( '0', '0', '1', '0' );
        
        wait;
    end process;
    
end architecture;

