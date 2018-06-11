Rails.application.config.automation = {
    parameters: {
      accompanying_team: {
        fr: {
          contact_params: '?utm_source=fr-automation-1&utm_medium=email&utm_campaign=automation-fr-1&utm_content=link-support',
          help_params: '?utm_source=fr-automation-1&utm_medium=email&utm_campaign=automation-fr-1&utm_content=link-index-doc',
          panel_first: { link: '?utm_source=fr-automation-1&utm_medium=email&utm_campaign=automation-fr-1&utm_content=link-before-start' },
          panel_second: { link: '?utm_source=fr-automation-1&utm_medium=email&utm_campaign=automation-fr-1&utm_content=link-start' },
          panel_third: { link: '?utm_source=fr-automation-1&utm_medium=email&utm_campaign=automation-fr-1&utm_content=link-global-settings' }
        },
        en: {
          contact_params: '?utm_source=en-automation-1&utm_medium=email&utm_campaign=automation-en-1&utm_content=link-support-1',
          help_params: '?utm_source=en-automation-1&utm_medium=email&utm_campaign=automation-en-1&utm_content=link-doc-index-1',
          panel_first: { link: '?utm_source=en-automation-1&utm_medium=email&utm_campaign=automation-en-1&utm_content=link-before-start' },
          panel_second: { link: '?utm_source=en-automation-1&utm_medium=email&utm_campaign=automation&utm_content=link-start' },
          panel_third: { link: '?utm_source=en-automation-1&utm_medium=email&utm_campaign=automation-en-1&utm_content=link-global-settings' }
        },
        image_links: {
          panel_first: 'https://www.mapotempo.com/wp-content/uploads/2015/10/éclair.png',
          panel_second: 'https://www.mapotempo.com/wp-content/uploads/2015/10/key.png',
          panel_third: 'https://www.mapotempo.com/wp-content/uploads/2015/10/user.png'
        }
      },
      features: {
        fr: {
          contact_params: '?utm_source=fr-automation-2&utm_medium=email&utm_campaign=automation-fr-2&utm_content=link-support-2',
          help_params: '?utm_source=fr-automation-2&utm_medium=email&utm_campaign=automation-fr-2&utm_content=link-index-doc-2',
          panel_first: {
            link: '?utm_source=fr-automation-2&utm_medium=email&utm_campaign=automation-fr-2&utm_content=link-vehicles-config',
            youtube_links: {
              first: 'https://www.youtube.com/watch?v=9nrxDBXNabE&utm_source=fr-automation-2&utm_medium=email&utm_campaign=automation-fr-2&utm_content=link-video-vehicles-config'
            }
          },
          panel_second: {
            link: '?utm_source=fr-automation-2&utm_medium=email&utm_campaign=automation-fr-2&utm_content=link-destinations',
            youtube_links: {
              first: 'https://www.youtube.com/watch?v=PJ4cOBzinaM&utm_source=fr-automation-2&utm_medium=email&utm_campaign=automation-fr-2&utm_content=link-video-destinations',
              second: 'https://www.youtube.com/watch?v=vhmPLcyRMcA&utm_source=fr-automation-2&utm_medium=email&utm_campaign=automation-fr-2&utm_content=link-video-tags'
            }
          },
          panel_third: {
            link: '?utm_source=fr-automation-2&utm_medium=email&utm_campaign=automation-fr-2&utm_content=link-zoning',
            youtube_links: {
              first: 'https://www.youtube.com/watch?v=h9qhEEZKzBc&utm_source=fr-automation-2&utm_medium=email&utm_campaign=automation-fr-2&utm_content=link-video-create-zoning',
              second: 'https://www.youtube.com/watch?v=ynFcGnznJcI&utm_source=fr-automation-2&utm_medium=email&utm_campaign=automation-fr-2&utm_content=link-video-change-zoning'
            }
          }
        },
        en: {
          contact_params: '?utm_source=en-automation-2&utm_medium=email&utm_campaign=automation-en-2&utm_content=link-support-2',
          help_params: '?utm_source=en-automation-2&utm_medium=email&utm_campaign=automation-en-2&utm_content=link-doc-index-2',

          panel_first: {
            link: '?utm_source=automation-en-2&utm_medium=email&utm_campaign=automation&utm_content=link-vehicle-config',
            youtube_links: {
              first: 'https://www.youtube.com/watch?v=9nrxDBXNabE&utm_source=en-automation-1&utm_medium=email&utm_campaign=automation-en-2&utm_content=link-video-vehicle-config',
            }
          },
          panel_second: {
            link: '?utm_source=en-automation-1&utm_medium=email&utm_campaign=automation-en-2&utm_content=link-destinations',
            youtube_links: {
              first: 'https://www.youtube.com/watch?v=PJ4cOBzinaM&utm_source=en-automation-1&utm_medium=email&utm_campaign=automation-en-2&utm_content=link-video-destinations',
              second: 'https://www.youtube.com/watch?v=vhmPLcyRMcA&utm_source=en-automation-1&utm_medium=email&utm_campaign=automation-en-2&utm_content=link-video-tags'
            }
          },
          panel_third: {
            link: '?utm_source=en-automation-1&utm_medium=email&utm_campaign=automation-en-2&utm_content=link-zoning',
            youtube_links: {
              first: 'https://www.youtube.com/watch?v=h9qhEEZKzBc&utm_source=en-automation-1&utm_medium=email&utm_campaign=automation-en-2&utm_content=link-video-create-zoning',
              second: 'https://www.youtube.com/watch?v=ynFcGnznJcI&utm_source=en-automation-1&utm_medium=email&utm_campaign=automation-en-2&utm_content=link-video-change-zone'
            }
          }
        },
        image_links: {
          panel_first: 'https://www.mapotempo.com/wp-content/uploads/2015/10/truck.png',
          panel_second: 'https://www.mapotempo.com/wp-content/uploads/2015/10/map-marker.png',
          panel_third: 'https://www.mapotempo.com/wp-content/uploads/2015/10/ungroup.png'
        }
      },
      advanced_options: {
        fr: {
          contact_params: '?utm_source=fr-automation-3&utm_medium=email&utm_campaign=automation-fr-3&utm_content=link-support-3',
          help_params: '?utm_source=fr-automation-3&utm_medium=email&utm_campaign=automation-fr-3&utm_content=link-index-doc-3',
          panel_first: {
            link: '?utm_source=fr-automation-3&utm_medium=email&utm_campaign=automation-fr-3&utm_content=link-plans',
            youtube_links: {
              first: 'https://www.youtube.com/watch?v=1xPzktNdQIg&utm_source=fr-automation-3&utm_medium=email&utm_campaign=automation-fr-3&utm_content=link-video-create-plans',
              second: 'https://www.youtube.com/watch?v=H55Pmi4sIhQ&utm_source=fr-automation-3&utm_medium=email&utm_campaign=automation-fr-3&utm_content=link-video-manage-stops',
              third: 'https://www.youtube.com/watch?v=8kABOCz0wKM&utm_source=fr-automation-3&utm_medium=email&utm_campaign=automation-fr-3&utm_content=link-video-optimization',
              fourth: 'https://www.youtube.com/watch?v=vcScpd2xCSw&utm_source=fr-automation-3&utm_medium=email&utm_campaign=automation-fr-3&utm_content=link-video-export',
              fifth: 'https://www.youtube.com/watch?v=_ggx3V9Zl6g&utm_source=fr-automation-3&utm_medium=email&utm_campaign=automation-fr-3&utm_content=link-video-gps-export'
            }
          },
          panel_second: {
            link: '?utm_source=fr-automation-3&utm_medium=email&utm_campaign=automation-fr-3&utm_content=link-webfleet',
            youtube_links: {
              first: 'https://www.youtube.com/watch?v=uqIHqSLki8U&utm_source=fr-automation-3&utm_medium=email&utm_campaign=automation-fr-3&utm_content=link-video-webfleet'
            }
          },
          panel_third: {
            link: '?utm_source=fr-automation-3&utm_medium=email&utm_campaign=automation-fr-3&utm_content=link-advanced-options'
          }
        },
        en: {
          contact_params: '?utm_source=en-automation-3&utm_medium=email&utm_campaign=automation-en-3&utm_content=link-support-3',
          help_params: '?utm_source=en-automation-3&utm_medium=email&utm_campaign=automation-en-3&utm_content=link-doc-index-3',
          panel_first: {
            link: '?utm_source=en-automation-1&utm_medium=email&utm_campaign=automation-en-3&utm_content=link-plans',
            youtube_links: {
              first: 'https://www.youtube.com/watch?v=1xPzktNdQIg&utm_source=en-automation-1&utm_medium=email&utm_campaign=automation-en-3&utm_content=link-video-create-plans',
              second: 'https://www.youtube.com/watch?v=H55Pmi4sIhQ&utm_source=en-automation-1&utm_medium=email&utm_campaign=automation-en-3&utm_content=link-video-stops',
              third: 'https://www.youtube.com/watch?v=8kABOCz0wKM&utm_source=en-automation-1&utm_medium=email&utm_campaign=automation-en-3&utm_content=link-video-optimization',
              fourth: 'https://www.youtube.com/watch?v=vcScpd2xCSw&utm_source=en-automation-1&utm_medium=email&utm_campaign=automation&utm_content=link-video-export',
              fifth: 'https://www.youtube.com/watch?v=_ggx3V9Zl6g&utm_source=en-automation-1&utm_medium=email&utm_campaign=automation-en-3&utm_content=link-video-export-gps'
            }
          },
          panel_second: {
            link: '?utm_source=en-automation-1&utm_medium=email&utm_campaign=automation-en-3&utm_content=link-webfleet',
            youtube_links: {
              first: 'https://www.youtube.com/watch?v=uqIHqSLki8U&utm_source=en-automation-1&utm_medium=email&utm_campaign=automation-en-3&utm_content=link-video-webfleet'
            }
          },
          panel_third: {
            link: '?utm_source=en-automation-1&utm_medium=email&utm_campaign=automation-en-3&utm_content=link-options'
          }
        },
        image_links: {
          panel_first: 'https://www.mapotempo.com/wp-content/uploads/2015/10/calendar.png',
          panel_second: 'https://www.mapotempo.com/wp-content/uploads/2015/10/globe.png',
          panel_third: 'https://www.mapotempo.com/wp-content/uploads/2015/10/cog.png'
        }
      },
      accompanying_message: {
        fr: {
          link: '?utm_source=fr-automation-4&utm_medium=email&utm_campaign=automation-fr-4&utm_content=link-support-4'
        },
        en: {
          link: '?utm_source=en-automation-4&utm_medium=email&utm_campaign=automation-en-4&utm_content=link-support-4'
        }
      },
      subscribe_message: {
        fr: {
          link: '?utm_source=fr-automation-5&utm_medium=email&utm_campaign=automation-fr-5&utm_content=link-subscribe'
        },
        en: {
          link: '?utm_source=en-automation-1&utm_medium=email&utm_campaign=automation-en-5&utm_content=link-subscribe'
        }
      }
    },
    network_icons: {
      facebook: "https://www.mapotempo.com/wp-content/uploads/2018/06/facebook.png",
      linkedin: "https://www.mapotempo.com/wp-content/uploads/2018/06/linkedin.png",
      twitter: "https://www.mapotempo.com/wp-content/uploads/2018/06/twitter.png"
    }
  }
