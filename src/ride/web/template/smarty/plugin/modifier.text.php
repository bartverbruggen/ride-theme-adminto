<?php

use ride\library\cms\content\TextParser;

if (!function_exists('smarty_modifier_text')) {
    function smarty_modifier_text($string) {
        static $textParser;

        if (!$textParser) {
            global $system;

            $dependencyInjector = $system->getDependencyInjector();

            $smartyEngine = $dependencyInjector->get('ride\\library\\template\\engine\\Engine', 'smarty');
            $smartyEngine = $smartyEngine->getSmarty();

            $app = $smartyEngine->getTemplateVars('app');

            if (isset($app['locale'])) {
                $locale = $app['locale'];
            } else {
                $locale = 'en';
            }

            $textParser = $dependencyInjector->get('ride\\library\\cms\\content\\text\\TextParser', 'chain');
            $textParser->setNode($app['cms']['node']);
            $textParser->setLocale($locale);
        }

        return $textParser->parseText($string);
    }
}
