# -*- coding: utf-8 -*-

"""
This module defines the global constants.
"""

import os
import tempfile

AUTH_URL = 'https://accounts.coursera.org/api/v1/login'
CLASS_URL = 'https://class.coursera.org/{class_name}'
ABOUT_URL = 'https://www.coursera.org/maestro/api/topic/information?' \
            'topic-id={class_name}'
AUTH_REDIRECT_URL = 'https://class.coursera.org/{class_name}' \
                    '/auth/auth_redirector?type=login&subtype=normal'

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), '..'))
PATH_CACHE = os.path.join( tempfile.gettempdir(), '_coursera_dl_cache' )
PATH_COOKIES = os.path.join(PATH_CACHE, 'cookies')
