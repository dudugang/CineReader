% Matlab class to read CINE and post process them according to CINE
% parameters. Post processing includes demosaicing and color correction
classdef CineReader < CineReaderRaw
    %CINEREADER Summary of this class goes here
    %   Detailed explanation goes here
    
    properties        

    end
    
    
    methods
        function this = CineReader(filename)
            this@CineReaderRaw(filename);            
        end

        function im = postprocess(this, im)
           im = flipud(im');
           % Demosaic
           im = demosaic(im, this.CFA);
           
           % Color correction
           
           % White Balance
           
           % Flip /rotate
           if (this.flipH)
               im = fliplr(im);
           end
           
           if (xor(this.flipV, this.rotate < 0))
               im = flipud(im);
           end
           if (abs(this.rotate) == 90)
              temp = zeros(size(im,2),size(im,1),size(im,3),class(im));
              for c = 1:size(im,3)
                 temp(:,:, c) = im(:,:,c)';
              end                          
           end
           
           
        end
        
    end
    
end

