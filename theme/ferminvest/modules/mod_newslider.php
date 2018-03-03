<div class="motion-event">
    <div class="title-motion-event"></div>
    <div class="wrap-item">
        <?php
        foreach ($slidercont as $slider) {
        ?>
        <div class="item">
            <div class="item-motion-event">
                <div class="motion-event-thumb">
                    <a href="#"><img src="<?php echo $slider['first_image']?$slider['first_image']:$slider['image']; ?>" alt="" style="width:770px; height: 500px;"/></a>
                </div>
                <div class="motion-event-info">
                    <h2><a href="<?php echo $slider['slug'];?>"><?php echo $slider['title'] ?></a></h2>
                    <ul>
                        <li><span class="lnr lnr-calendar-full"></span> <?php echo $slider['date'] ?></li>
                        <li><span class="lnr lnr-eye"></span> <?php echo $slider['hits'] ?></li>
                    </ul>
                </div>
            </div>
        </div>
        <?php } ?>
    </div>
</div>

<!--<div class="hot-topic-slider">-->
<!--    <div class="content-topic-slider">-->
<!--        <div class="wrap-item">-->
<!--            --><?php
//            foreach ($slidercont as $slider) {
//            ?>
<!--            <div class="item">-->
<!--                <div class="item-hot-topic">-->
<!--                    <a href="--><?php //echo $slider['slug'];?><!--"><img src="--><?php //echo $slider['first_image']?$slider['first_image']:$slider['image']; ?><!--" alt="" style="width: 770px;height: 513px;"/></a>-->
<!--                    <h2>--><?php //echo $slider['title'] ?><!--</h2>-->
<!--                </div>-->
<!--            </div>-->
<!--                --><?php
//
//            }?>
<!--        </div>-->
<!--    </div>-->
<!--</div>-->

<!--                <div class="item">-->
<!--                    <div class="item-featured-newday">-->
<!--                        <div class="featured-newday-thumb">-->
<!--                            <a href="--><?php //echo $slider['slug'];?><!--"><img src="--><?php //echo $slider['first_image']?$slider['first_image']:$slider['image']; ?><!--" alt="" style="width: 370px;height: 240px;"/></a>-->
<!--                        </div>-->
<!--                        <div class="featured-newday-info">-->
<!--                            <h3><a href="--><?php //echo $slider['slug'];?><!--">--><?php //echo $slider['title'] ?><!--</a></h3>-->
<!--                        </div>-->
<!--                        <ul class="featurred-cat-newday">-->
<!--                            <li><span class="lnr lnr-clock"></span> --><?php //echo $slider['date'] ?><!--</li>-->
<!--                            <li><span class="lnr lnr-eye"> --><?php //echo $slider['hits'] ?><!--</li>-->
<!---->
<!--                        </ul>-->
<!--                    </div>-->
<!--                </div>-->





