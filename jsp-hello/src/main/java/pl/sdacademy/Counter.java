package pl.sdacademy;

import java.util.concurrent.atomic.AtomicInteger;

public enum Counter {
    INSTANCE;

    private AtomicInteger count = new AtomicInteger(-1);

    public Integer getCount() {
        return count.incrementAndGet();
    }
}
