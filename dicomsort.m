%DICOM sorter for GE 
clear all
clc
files = spm_select('FPList',cd,'\.dcm');

warning('off','all')
wb = waitbar(0, 'Sorting dicoms ...');
se = '*CAL';
tic
fprintf('%-40s: %30s\n','Sorting dicoms files into series folder', spm('time'));

for i=1:length(files)  
    waitbar(i/length(files))
    file = dicominfo(files(i,:));
    serie = file.SeriesDescription;
    if strcmp(serie,se)
        serie = 'CAL';
    end
    mkdir(serie)
    cd(serie)
    movefile(files(i,:),cd)
    cd ..
end
toc 
fprintf('%-40s: %30s\n','Completed!', spm('time'));