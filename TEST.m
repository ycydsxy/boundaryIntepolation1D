inlet_r01=0.078978702426;
inlet_R1=0.16630500555;
inlet_r02=0.07987;
inlet_R2=0.16739;

outlet_r01=0.0830108970404;
outlet_R1=0.160895004869;
outlet_r02=0.08742616;
outlet_R2=0.160379;

new_inlet_90=boundaryIntepolation1D(old_inlet_90,inlet_r01,inlet_R1,inlet_r02,inlet_R2);
new_inlet_115=boundaryIntepolation1D(old_inlet_115,inlet_r01,inlet_R1,inlet_r02,inlet_R2);
new_inlet_123=boundaryIntepolation1D(old_inlet_123,inlet_r01,inlet_R1,inlet_r02,inlet_R2);

new_outlet_90=boundaryIntepolation1D(old_outlet_90,outlet_r01,outlet_R1,outlet_r02,outlet_R2);
new_outlet_115=boundaryIntepolation1D(old_outlet_115,outlet_r01,outlet_R1,outlet_r02,outlet_R2);
new_outlet_123=boundaryIntepolation1D(old_outlet_123,outlet_r01,outlet_R1,outlet_r02,outlet_R2);
