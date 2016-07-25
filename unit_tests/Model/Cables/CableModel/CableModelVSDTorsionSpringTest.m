% Testing of VSD torsion spring 
%
% Author        : Jonathan EDEN
% Created       : 2016
% Description    :
classdef CableModelVSDTorsionSpringTest < CableModelTestBase
    methods (Test) 
        function testCableModelVSDTorsionSpring(testCase)
            c = CableModelVSDTorsionSpring('1',1);
            testCase.assertNotEmpty(c);
        end
        
        function testUpdate(testCase)
            c = CableModelVSDTorsionSpring('1',1);
            % Create the body model
            model_config = ModelConfig(TestModelConfigType.T_SCDM);
            modelObj = model_config.getModel(model_config.defaultCableSetId);
            c.update(modelObj.bodyModel);
        end
        
        function testLength(testCase)
            c = CableModelVSDTorsionSpring('1',1);
            c.force = 0;
            l = c.length;
            testCase.assertPositiveCableLengths(l);
        end
        
        function testK(testCase)
            c = CableModelVSDTorsionSpring('1',1);
            c.force = 0;
            K = c.K;
        end
    end
end