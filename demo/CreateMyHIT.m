function HITId = CreateMyHIT(img,title_text,question_text,c1text,c2text,c3text,ant)
title_text = urlencode(title_text);
question_text = urlencode(question_text);
c1text = urlencode(c1text);
c2text = urlencode(c2text);
c3text = urlencode(c3text);
if (ant)
    anttext = 'Y';
else
    anttext = '';
end

% title_text = urlencode('Image annotation');
% question_text = urlencode('Please annotate the EYES and choose the GENDER of this person');
% c1text = 'Male';
% c2text = 'Female';
% c3text = '';
addpath ..:../mturkAPI:../util;
imwrite(img,'/Users/why/Documents/Laboratory/mturkMatlab/demo/temp.jpg');
setenv('PATH','/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin');
[a,b] = system('aws s3 ls s3://vclamturk/');
c = regexp(b, ' [0-9]*.jpg', 'match');
maxi = -1;
for i = 1:length(c)
    maxi = max(maxi,str2double(c{i}(1:end-4)));
end
image_index = maxi + 1;

image_index = num2str(image_index);
[a,b] = system(['aws s3 cp /Users/why/Documents/Laboratory/mturkMatlab/demo/temp.jpg s3://vclamturk/',image_index,'.jpg --grants read=uri=http://acs.amazonaws.com/groups/global/AllUsers']);

questionFile = 'external_hit2.question';

params = CreateHITStruct();
turk = turkConfig();
turk.sandbox = true;

params.Title = 'External HIT demo';
params.Description = 'This external HIT has been created using MATLAB! Check out the mturkMatlab toolbox to see how.';

question = readTextFile(questionFile);
question = strrep(question, 'image_index', image_index);
question = strrep(question, 'title_text', title_text);
question = strrep(question, 'question_text', question_text);
question = strrep(question, 'c1text', c1text);
question = strrep(question, 'c2text', c2text);
question = strrep(question, 'c3text', c3text);
question = strrep(question, 'anttext', anttext);
params.Question = question;

params.Reward.Amount = 0.01;
params.AssignmentDurationInSeconds = 15*60;
params.LifetimeInSeconds = 60*60*24*3;
params.Keywords = 'external, hit, mturkMatlab';
%results = cell(numHITs, 1);

%for i=1:numHITs
    % disp(['Creating HIT ' num2str(i) ' of ' num2str(numHITs)]);
result = CreateHIT(turk, params);
%end
HITId = result.HITId;
end