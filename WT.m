function [wt,freqlist,psi_array] = awt_freqlist(x,Fs,freqlist,type,xi)

%   [wt,freqlist,psi_array] = awt_freqlist(x,Fs,freqlist,type,xi)
%
%   Inputs:
%       x           the signal to be analyzed
%       Fs          the sampling frequency
%       freqlist    list of frequencies at which to compute wt (optional)
%                   (or set to [] for automatic definition)
%       type        Gabor
%       xi          the number of oscillations parameter
%   Outputs:
%       wt: time-frequency image
%       freqlist: useful in case of automatic definition of frequencies
%       psi_array : array of analysis functions (complex values)
%

%  modified from awt from wavelab toolbox

n = length(x);
sigma2 = 1;
x = x(:);
omega = [(0:n/2) (-ceil(n/2)+1:-1)].*Fs/n; 
omega = omega(:);

fftx = fft(x);

tolerance = 0.5; 

if nargin<2 
    Fs = 1;
end
if nargin<4
    type = 'Gabor';
end
if nargin<5
    xi = 5; 
end

        mincenterfreq = 2*tolerance*sqrt(sigma2)*Fs*xi./n;
        maxcenterfreq = Fs*xi/(xi+tolerance/sqrt(sigma2));
    
        s_array = xi./freqlist;
        minscale = xi./maxcenterfreq;
        maxscale = xi./mincenterfreq;
 
        freq =  ( omega*s_array  - xi);
        Psi = bsxfun(@times,realpow(4.*pi.*sigma2,1/4) *sqrt(s_array),exp(-sigma2/2*realpow(freq,2)));
   
wt = ifft(bsxfun(@times,Psi,fftx),[],1);
wt(:,s_array(:)'<minscale | s_array(:)'>maxscale)=0;
if nargout>=3
    psi_array=ifft(Psi);
end
    


