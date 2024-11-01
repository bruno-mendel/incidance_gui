%%
fig_left = 50;
fig_bottom = 20;
fig_width = 300;
fig_height = 250;
h = figure(5);
set(h, 'position', [fig_left, fig_bottom, fig_width, fig_height]);
uicontrol('Style', 'edit', 'Position', [50, 100, 200, 30]);
uicontrol('Style', 'pushbutton', 'String', 'Cliquez-moi', ...
          'Position', [50, 150, 100, 30]);
