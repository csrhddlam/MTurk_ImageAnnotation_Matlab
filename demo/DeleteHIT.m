function [] = DeleteHIT(str)
    turk = turkConfig();
    r = SearchHITs(turk, SearchHITsStruct());
    if(isfield(r, 'HIT'))
        for i=1:length(r.HIT)
            if (strcmp(r.HIT(i).HITId, str))
                ForceExpireHIT(turk, ForceExpireHITStruct(r.HIT(i)));
                DisableHIT(turk, DisableHITStruct(r.HIT(i)));
                DisposeHIT(turk, DisposeHITStruct(r.HIT(i)));
            end
        end
    end
end