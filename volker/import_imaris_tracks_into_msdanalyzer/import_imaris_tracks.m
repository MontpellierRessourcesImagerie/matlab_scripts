T = NC2cmleredfree; % set the table

T.Properties.VariableNames = ["X", "Y", "Z", "Unit", "Category", "Collection", "T", "TRACK_ID", "ID"];

TRACK_IDS = unique(T.TRACK_ID);
N_PARTICLES = length(TRACK_IDS);

mTracks = cell(N_PARTICLES, 1);

for i = 1 : N_PARTICLES
    id = TRACK_IDS(i);
    idx = T.TRACK_ID == id;
    tableForTrack = T(idx,:);
    mTracks{i} = [tableForTrack.T tableForTrack.X tableForTrack.Y];
end
clear id idx tableForTrack

ma = msdanalyzer(N_DIM, SPACE_UNITS, TIME_UNITS);
ma = ma.addAll(mTracks);
