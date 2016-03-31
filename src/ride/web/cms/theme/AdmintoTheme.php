<?php

namespace ride\web\cms\theme;

use ride\library\cms\theme\Theme;
use ride\library\template\theme\AdmintoTheme as AdmintoTemplateTheme;


/**
 * Interface for a template theme
 */
class AdmintoTheme extends AdmintoTemplateTheme implements Theme {

    /**
     * Regions of this theme
     * @var unknown
     */
    protected $regions = array(
        'content' => 'content',
        'header' => 'header',
        'title' => 'title',
        'footer' => 'footer',
        'flyout' => 'flyout',
    );

    /**
     * Checks if a region exists in this layout
     * @return boolean
     */
    public function hasRegion($region) {
        return isset($this->regions[$region]);
    }

    /**
     * Gets the regions for this theme
     * @return array Array with the region name as key and as value
     */
    public function getRegions() {
        return $this->regions;
    }

}
