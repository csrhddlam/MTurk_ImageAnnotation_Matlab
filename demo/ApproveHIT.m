function [] = ApproveHIT(str)
    turk = turkConfig();
    r = SearchHITs(turk, SearchHITsStruct());
    if(isfield(r, 'HIT'))
        for i=1:length(r.HIT)
            if (strcmp(r.HIT(i).HITId, str))
                r2 = GetAssignmentsForHIT(turk, GetAssignmentsForHITStruct(r.HIT(i)));
                if(isfield(r2, 'Assignment'))
                    for j=1:length(r2.Assignment) % default 1
                        assignment = r2.Assignment(j);
                        % save([turk.assignmentsFolder '/' assignment.AssignmentId '.mat'], 'assignment');
                        params = ApproveAssignmentStruct(assignment);
                        params.RequesterFeedback = 'Thank you for your participation in our HITs! We appreciate your hard work.';
                        ApproveAssignment(turk, params);
                        % text = parseXMLstring(assignment.Answer);
                        % data = text.QuestionFormAnswers.Answer;
                        % save(HITFile, 'assignment', 'data');
                    end
                end
            end
        end
    end
end