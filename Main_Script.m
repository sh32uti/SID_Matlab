%% Clearing the workspace
clc
clear all
close all
%
%% Reading in the data........
% key_words...
kw={'''stress''', '''depress''', '''quit''', '''kill''', '''suicide''', '''die''', '''suicid''',...
    '''depression''','''alone''', '''alon''','''pain''','''life'''};
% Training Data
train_data=readtable('training.xlsx');
%Testing Data
test_data=readtable('testing.xlsx');
%Validation Data
val_data=readtable('validation.xlsx');

%% generate the final training data
a = table2array(train_data(:,3));
%temp_len=0;
train_vec=[];
for i=1:size(a,1)
ab=a(i,:);
fv=bw2featurevector(ab,kw);
% tl=length(fv)
% if tl>=temp_len
%     temp_len=tl;
% end
train_vec=[train_vec;fv];
end
%
train_label=table2array(train_data(:,1))+1;
%% generate the final testing data

aa = table2array(test_data(:,3));
%temp_len=0;
test_vec=[];
for i=1:size(aa,1)
aab=aa(i,:);
fv=bw2featurevector(aab,kw);
% tl=length(fv)
% if tl>=temp_len
%     temp_len=tl;
% end
test_vec=[test_vec;fv];
end
test_label=table2array(test_data(:,1))+1;
%% generate the final validation data

aaa = table2array(val_data(:,3));
%temp_len=0;
val_vec=[];
for i=1:size(aaa,1)
aaab=aaa(i,:);
fv=bw2featurevector(aaab,kw);
% tl=length(fv)
% if tl>=temp_len
%     temp_len=tl;
% end
val_vec=[val_vec;fv];
end

%% Training the SVM
md1=fitcsvm(train_vec,train_label);
%% Predicting the labels for the test data
[predict_label,score] = predict(md1,test_vec);
predictions=[predict_label,score];
results_check=[predict_label,test_label];

%% Confusion Matrix and results
true_C = confusionmat(test_label,test_label);
predict_C = confusionmat(test_label,predict_label);
confusionchart(predict_C);
% Accuracy
acc=(sum(diag(predict_C))/sum(diag(true_C)))*100
