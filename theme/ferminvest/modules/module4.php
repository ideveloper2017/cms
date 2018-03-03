<?php
$params = unserialize($inMod['params']);
?>
<!--class="cs-container"-->
<div <?php if ($inMod['css_prefix']) { ?>class="<?php echo $inMod['css_prefix']?>" <?php } ?>>
    <div class="cs-row">
        <div class="cs-col cs-col-12-of-12">
            <div class="cs-post-block-title">
                <h4><?php echo $inMod['title'];?></h4>
            </div>
        </div>
        <?php print $inMod['body'] . $inMod['jscode'];?>
    </div>
</div>


<!--<div --><?php //if ($inMod['css_prefix']) { ?><!--class="--><?php //echo $inMod['css_prefix']?><!--" --><?php //} ?><!-->
<!--    <div class="s-grid-left">-->
<!--        <div class="cricket">-->
<!--    --><?php
//    if ($inMod['showtitle']) {
//        ?>
<!--        <header>-->
<!--            <h3 class="title-head">--><?php //echo $inMod['title'];?><!--</h3>-->
<!--        </header>-->
<!--       --><?php
//    }
//    print $inMod['body'] . $inMod['jscode'];
//    ?>
<!--</div>-->
<!--    </div>-->
<!--    </div>-->
