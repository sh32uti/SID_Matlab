function [temp_array] = bw2featurevector(ab,kw)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
str_ab = char(ab);
str_ab1= str_ab(2:end-2);
str_ab1 = str_ab1(find(~isspace(str_ab1)));
newstr = split(str_ab1,",");
newstr=newstr';
%temp_array=zeros(1,length(newstr));
temp_array=zeros(1,500); % Chosing only first 500 words
if length(newstr)>=length(temp_array)
    loops=length(temp_array);
else
    loops=length(newstr);
end
%
for i=1:loops %length(newstr)
    if any(strcmp(kw,newstr(i)))
        temp_array(i)=1;
    end
end
end

