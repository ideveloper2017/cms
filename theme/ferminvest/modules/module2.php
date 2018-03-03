<?php
$params = unserialize($inMod['params']);
?>

<div class="cs-col cs-col-12-of-12">
    <div class="cs-post-block-title">
        <?php
        if ($inMod['showtitle']) {
            echo '<h4>' . $inMod['title'] . '</h4>';
        }
        ?>
    </div>
</div>
<!--<div --><?php //if ($inMod['css_prefix']) { ?><!--class="--><?php //echo $inMod['css_prefix']?><!--" --><?php //} ?><!-->

<?php
//    print "</div>";
print $inMod['body'] . $inMod['jscode'];
?>





