<project xmlns="com.autoesl.autopilot.project" name="fft_512" top="fft_512_top">
    <includePaths/>
    <libraryPaths/>
    <Simulation>
        <SimFlow name="csim" csimMode="0" lastCsimMode="0"/>
    </Simulation>
    <files xmlns="">
        <file name="../fft_tb.cpp" sc="0" tb="1" cflags=" -Wno-unknown-pragmas" csimflags=" -Wno-unknown-pragmas" blackbox="false"/>
        <file name="fft_512/fft.cpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="fft_512/fft.h" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="fft_512/tw.cpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="fft_512/tw.h" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
    </files>
    <solutions xmlns="">
        <solution name="solution1" status="active"/>
    </solutions>
</project>

