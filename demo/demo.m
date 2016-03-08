%% Annotation
img = imread('temp.jpg');
title_text = 'Image annotation';
question_text = 'Please annotate the EYES of this person';
c1text = ''; % no choices
c2text = ''; % no choices
c3text = ''; % no choices
ant = true;
HITId1 = CreateMyHIT(img,title_text,question_text,c1text,c2text,c3text,ant);

%% Question
img = imread('temp.jpg');
title_text = 'Choices';
question_text = 'Please choose the GENDER of this person';
c1text = 'Male'; % choice 1
c2text = 'Female'; % choice 2
c3text = ''; % no choice
ant = false;
HITId2 = CreateMyHIT(img,title_text,question_text,c1text,c2text,c3text,ant);

%% Together
img = imread('temp.jpg');
title_text = 'Image annotation and choices';
question_text = 'Please annotate the EYES and choose the GENDER of this person';
c1text = 'Male'; % choice 1
c2text = 'Female'; % choice 2
c3text = ''; % no choices
ant = true;
HITId3 = CreateMyHIT(img,title_text,question_text,c1text,c2text,c3text,ant);

%% Get Results
% Similar to HITId2 and HITId3

% result1 = CheckHITs(HITId1); % return [], if nobody did it.
% result1 = CheckHITs(HITId1); % return the result structure, after someone did it.
% ApproveHIT(HITId1); % approve it
% DeleteHIT(HITId1); % delete it


