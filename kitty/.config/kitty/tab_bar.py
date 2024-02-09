import datetime

from kitty.fast_data_types import Screen, get_options
from kitty.tab_bar import (DrawData, ExtraData, TabBarData, as_rgb,
                           draw_tab_with_powerline, draw_title)
from kitty.utils import color_as_int
from kittens.tui.loop import debug

def draw_tab(
    draw_data: DrawData, screen: Screen, tab: TabBarData,
    before: int, max_tab_length: int, index: int, is_last: bool,
    extra_data: ExtraData
) -> int:
    debug('hello')
    draw_tab_with_powerline(draw_data, screen, tab, before, max_tab_length, index, is_last, extra_data)
